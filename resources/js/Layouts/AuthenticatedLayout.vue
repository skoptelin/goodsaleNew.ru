<script setup>
    import { ref } from 'vue';
    import ApplicationLogo from '@/Components/ApplicationLogo.vue';
    import Dropdown from '@/Components/Dropdown.vue';
    import DropdownLink from '@/Components/DropdownLink.vue';
    import NavLink from '@/Components/NavLink.vue';
    import ResponsiveNavLink from '@/Components/ResponsiveNavLink.vue';
    import { Link } from '@inertiajs/vue3';
    import ErrorBoundary from '@/Components/ErrorBoundary.vue';

    const showingNavigationDropdown = ref(false);
</script>

<template>
    <ErrorBoundary>
        <div>
            <div class="min-h-screen bg-white">
                <nav class="bg-sky-500 fixed z-50 inset-x-0 top-0">
                    <!-- Primary Navigation Menu -->
                    <div class="max-w-full mx-auto px-4 sm:px-6 lg:px-8">
                        <div class="flex justify-between h-16">
                            <div class="flex">
                                <!-- Logo -->
                                <div class="shrink-0 flex">
                                    <Link href="/ads">
                                        <ApplicationLogo class="w-36 h-4 mt-5" />
                                    </Link>
                                </div>
                            </div>

                            <div class="hidden sm:flex sm:items-center sm:ml-6">

                                <!-- Navigation Links -->
                                <div class="hidden mr-8 sm:-my-px sm:flex">
                                    <NavLink :href="route('ads.index')" :active="route().current('ads.index')">
                                        Лента
                                    </NavLink>
                                </div>
                                <div v-if="$page.props.auth.user == null" class="hidden mr-8 sm:-my-px sm:flex">
                                    <NavLink :href="route('login')" :active="route().current('login')">
                                        Войти
                                    </NavLink>
                                </div>

                                <div v-if="$page.props.auth.user" class="hidden mr-8 sm:-my-px sm:flex">
                                    <NavLink :href="route('my_ads.index')" :active="route().current('my_ads.index')">
                                        Мои объявления
                                    </NavLink>
                                </div>

                                <div v-if="$page.props.auth.user" class="flex">
                                    <!-- Settings Dropdown -->
                                    <div class="ml-3 relative">
                                        <Dropdown align="right" width="48">
                                            <template #trigger>
                                                <span class="inline-flex rounded-md">
                                                    <button
                                                        type="button"
                                                        class="inline-flex items-center px-3 py-2 border border-transparent text-base leading-4 font-medium rounded-none text-white bg-sky-500 hover:text-white transition ease-in-out duration-150 background-blue-text-white"
                                                    >
                                                        {{ $page.props.auth.user.name }}

                                                        <svg
                                                            class="ml-2 -mr-0.5 h-4 w-4"
                                                            xmlns="http://www.w3.org/2000/svg"
                                                            viewBox="0 0 20 20"
                                                            fill="currentColor"
                                                        >
                                                            <path
                                                                fill-rule="evenodd"
                                                                d="M5.293 7.293a1 1 0 011.414 0L10 10.586l3.293-3.293a1 1 0 111.414 1.414l-4 4a1 1 0 01-1.414 0l-4-4a1 1 0 010-1.414z"
                                                                clip-rule="evenodd"
                                                            />
                                                        </svg>
                                                    </button>
                                                </span>
                                            </template>

                                            <template #content>
                                                <DropdownLink :href="route('profile.edit')"> Профиль </DropdownLink>
                                                <DropdownLink :href="route('logout')" method="post" as="button">
                                                    Выйти из профиля
                                                </DropdownLink>
                                            </template>
                                        </Dropdown>
                                    </div>
                                </div>

                            </div>

                            <!-- Hamburger -->
                            <div class="-mr-2 flex items-center sm:hidden">
                                <button
                                    @click="showingNavigationDropdown = !showingNavigationDropdown"
                                    class="iinline-flex items-center justify-center p-2 rounded-md text-white hover:text-white hover:bg-sky-500 focus:outline-none focus:bg-sky-700 focus:text-white transition duration-150 ease-in-out"
                                >
                                    <svg class="h-6 w-6" stroke="currentColor" fill="none" viewBox="0 0 24 24">
                                        <path
                                            :class="{
                                                hidden: showingNavigationDropdown,
                                                'inline-flex': !showingNavigationDropdown,
                                            }"
                                            stroke-linecap="round"
                                            stroke-linejoin="round"
                                            stroke-width="2"
                                            d="M4 6h16M4 12h16M4 18h16"
                                        />
                                        <path
                                            :class="{
                                                hidden: !showingNavigationDropdown,
                                                'inline-flex': showingNavigationDropdown,
                                            }"
                                            stroke-linecap="round"
                                            stroke-linejoin="round"
                                            stroke-width="2"
                                            d="M6 18L18 6M6 6l12 12"
                                        />
                                    </svg>
                                </button>
                            </div>
                        </div>
                    </div>

                    <!-- Responsive Navigation Menu -->
                    <div
                        :class="{ block: showingNavigationDropdown, hidden: !showingNavigationDropdown }"
                        class="sm:hidden"
                    >
                        <div class="pt-2 pb-3 space-y-1">
                            <ResponsiveNavLink :href="route('ads.index')" :active="route().current('ads.index')">
                                Лента
                            </ResponsiveNavLink>
                        </div>
                        <div v-if="$page.props.auth.user == null" class="pt-2 pb-3 space-y-1">
                            <ResponsiveNavLink :href="route('login')" :active="route().current('login')">
                                Войти
                            </ResponsiveNavLink>
                        </div>
                        <div v-if="$page.props.auth.user" class="pt-2 pb-3 space-y-1">
                            <ResponsiveNavLink :href="route('my_ads.index')" :active="route().current('my_ads.index')">
                                Мои объявления
                            </ResponsiveNavLink>
                        </div>

                        <!-- Responsive Settings Options -->
                        <div v-if="$page.props.auth.user" class="pt-4 pb-1 border-t border-white">
                            <div class="px-4 text-right">
                                <div class="font-medium text-base text-white">
                                    {{ $page.props.auth.user.name }}
                                </div>
                                <div class="font-medium text-sm text-white">{{ $page.props.auth.user.email }}</div>
                            </div>

                            <div class="mt-3 space-y-1">
                                <ResponsiveNavLink :href="route('profile.edit')"> Профиль </ResponsiveNavLink>
                                <ResponsiveNavLink :href="route('logout')" method="post" as="button">
                                    Выйти из профиля
                                </ResponsiveNavLink>
                            </div>
                        </div>
                    </div>
                </nav>

                <!-- Page Heading -->
                <header class="bg-white shadow" v-if="$slots.header">
                    <div class="max-w-7xl mx-auto py-6 px-4 sm:px-6 lg:px-8">
                        <slot name="header" />
                    </div>
                </header>

                <!-- Page Content -->
                <main>
                    <slot />
                </main>
            </div>
        </div>
    </ErrorBoundary>
</template>
