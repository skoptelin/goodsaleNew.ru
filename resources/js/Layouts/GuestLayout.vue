<script setup>
import ApplicationLogo from '@/Components/ApplicationLogo.vue';
import { Link } from '@inertiajs/vue3';
import NavLink from '@/Components/NavLink.vue';
</script>

<template>
    <nav class="bg-sky-500 border-b border-gray-100">
        <!-- Primary Navigation Menu -->
        <div class="max-w-full mx-auto px-4 sm:px-6 lg:px-8">
            <div class="flex justify-between h-16">
                <div class="flex">
                    <!-- Logo -->
                    <div class="shrink-0 flex items-center">
                        <NavLink class="border-none underline-none" :href="route('ads.index')" :active="route().current('ads.index')">
                            GoodSale.ru
                        </NavLink>
                    </div>

                    <div class="hidden sm:flex sm:items-center sm:ml-6">
                        <!-- Navigation Links -->
                        <div class="hidden mr-8 sm:-my-px sm:flex">
                            <NavLink :href="route('ads.index')" :active="route().current('ads.index')">
                                Лента
                            </NavLink>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </nav>

    <div class="min-h-screen flex flex-col sm:justify-center items-center pt-6 sm:pt-0 bg-gray-100">
        <!-- <div>
            <Link href="/">
                <ApplicationLogo class="w-20 h-20 fill-current text-gray-500" />
            </Link>
        </div> -->

        <div
            class="w-full sm:max-w-md mt-6 px-6 py-4 bg-white shadow-md shadow-sky-500 overflow-hidden sm:rounded-lg"
        >
            <slot />
        </div>
    </div>
</template>
