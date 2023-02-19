<script>
    import AuthenticatedLayout from '@/Layouts/AuthenticatedLayout.vue';
    import { Head } from '@inertiajs/vue3';
    import AdsList from '@/Components/Ads/AdsList.vue';

    export default {
        props: {
            activeAds: Array,
        },

        components: {
            Head,
            AuthenticatedLayout,
            AdsList
        },

    }
</script>

<template>
    <Head title="Список всех объявлений" />

    <AuthenticatedLayout>
        
        <div class="adsList">
            <div v-for="ad in activeAds" :key="ad.id" :data-id="ad.id">
                <AdsList :data="ad"> 

                </AdsList>      
            </div>
        </div>
        
    </AuthenticatedLayout>
</template>