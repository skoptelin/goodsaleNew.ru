<script>
    import AuthenticatedLayout from '@/Layouts/AuthenticatedLayout.vue';
    import { Head } from '@inertiajs/vue3';

    export default {
        props: {
            activeAds: Array,
        },

        components: {
            Head,
            AuthenticatedLayout
        }
    }
</script>

<template>
    <Head title="Dashboard" />

    <AuthenticatedLayout>
        <template #header>
            <h2 class="font-semibold text-xl text-gray-800 leading-tight">Список объявлений</h2>
        </template>
        ЭТО работает!

        {{ activeAds }}

    </AuthenticatedLayout>
</template>