#pragma once 
#include <atomic>

namespace MyProject {
    namespace Memory {
        template <typename T>
        class SharedPtr {
        public:
            using element_type_t = T;

            explicit SharedPtr(T* ptr) : _data(ptr), _refCount(1) { }
            ~SharedPtr() {
                if (0 == --_refCount)
                    destroy();
            }

            SharedPtr(const SharedPtr& rhs) noexcept {
                _data = rhs._data;
                _refCount = ++_refCount;
            }

            SharedPtr& operator=(const SharedPtr& rhs) noexcept {
                _data = rhs._data;
                _refCount = ++_refCount;
                return *this;
            }

            SharedPtr(SharedPtr&& rhs) noexcept {
                _data = rhs._data;
                _refCount = rhs._refCount;
            }

            SharedPtr operator=(SharedPtr&& rhs) noexcept {
                std::swap(_data, rhs._data);
                std::swap(_refCount, rhs._refCount);
            }

            T* get() const noexcept {
                return _data;
            }

            explicit operator bool() const {
                return _data == nullptr;
            }

            T operator*() const {
                return *get();
            }

            T* operator->() const noexcept {
                return get();
            }

            void reset() noexcept {
                _refCount = 0;
                destroy();
            }

        private:
            void destroy() {
                delete _data;
                _data = nullptr;
            }

            T*                      _data;
            std::atomic<int>        _refCount;
        };
    }
}