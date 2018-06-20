#pragma once

namespace MyProject {
    namespace Memory {
        template <typename T>
        class UniquePtr {
        public:
            using element_type_t    = T*;
            typedef T* element_type;

            explicit UniquePtr(T* data) noexcept : _data(data) {}
            ~UniquePtr() noexcept {
                destroy();
            }
            UniquePtr(void) noexcept : _data(nullptr) {}
            UniquePtr(UniquePtr&& rhs) noexcept {
                std::swap(_data, rhs.get());
                rhs.reset();
            }

            UniquePtr operator=(UniquePtr&& rhs) noexcept {
                std::swap(_data, rhs.get());
                rhs.reset();
                return *this;
            }

            T* get() const noexcept {
                return _data;
            }

            T operator*() const {
                return *get();
            }

            T* operator->() const noexcept {
                return get();
            }

            operator bool() const {
                return _data != nullptr;
            }

            void release() noexcept {
                _data = nullptr;
            }

            void reset() noexcept {
                destroy();
            }

            UniquePtr(UniquePtr& rhs) = delete;
            UniquePtr operator=(UniquePtr& rhs) = delete;

        private:
            void destroy() noexcept {
                delete _data;
                _data = nullptr;
            }

            T*              _data;
        };
    }
}