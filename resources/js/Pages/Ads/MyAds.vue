<script setup>
    import AuthenticatedLayout from '@/Layouts/AuthenticatedLayout.vue';
    import { Head } from '@inertiajs/vue3';
    import MyAdsList from '@/Components/Ads/MyAdsList.vue';

    const props = defineProps({
        myAds: Array,
    });

</script>

<template>
    <Head title="Мои объявления" />

    <AuthenticatedLayout>
        
        <div class="adsList">
            <form action="my_ads/create" class="addButton" id="addButton">
                <button type="submit" id="addButton" class="myAdButton">Добавить</button>
            </form>
            <div v-if="myAds==''">У вас пока нет объявлений</div>
            <div v-for="ad in myAds" :key="ad.id" :data-ad-id="ad.id" class="adBox" id="adBox">
                
                <MyAdsList :data="ad"> 

                </MyAdsList>      
            </div>
        </div>
        
    </AuthenticatedLayout>
</template>