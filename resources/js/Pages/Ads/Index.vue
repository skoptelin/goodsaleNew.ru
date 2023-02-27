<script setup>
    import AuthenticatedLayout from '@/Layouts/AuthenticatedLayout.vue';
    import { Head, router } from '@inertiajs/vue3';
    import AdsList from '@/Components/Ads/AdsList.vue';

    const props = defineProps({
        activeAds: Array,
    });

    function goToAdDetailPage(event) {
        let click       = event.target;
        let adBox        = click.closest(".adBox");
        let button = adBox.querySelector('.adButton');

        if(click == button) {
            return false
        } else {
            router.get("/ads/" + adBox.dataset.id);
        }
    };
</script>

<template>
    <Head title="Список всех объявлений" />

    <AuthenticatedLayout>
        
        <div class="adsList">
            <div v-for="ad in activeAds" :key="ad.id" :data-id="ad.id" class="adBox" id="adBox" @click="goToAdDetailPage">
                <AdsList :data="ad"> 

                </AdsList>      
            </div>
        </div>
        
    </AuthenticatedLayout>
</template>