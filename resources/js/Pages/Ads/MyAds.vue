<script>
    import AuthenticatedLayout from '@/Layouts/AuthenticatedLayout.vue';
    import { Head } from '@inertiajs/vue3';
    import MyAdsList from '@/Components/Ads/MyAdsList.vue';
    import { setupProgress } from '@inertiajs/core';

    export default {
        props: {
            myAds: Array,
        },

        components: {
            Head,
            AuthenticatedLayout,
            MyAdsList
        }
    }
</script>

<template>
    <Head title="Мои объявления" />

    <AuthenticatedLayout>
        
        <div class="adsList">
            <form action="my_ads/create" class="addButton" id="addButton">
                <button type="submit" id="addButton" class="myAdButton">Добавить</button>
            </form>
            <div v-for="ad in myAds" :key="ad.id" :data-id="ad.id">
                <MyAdsList :data="ad"> 

                </MyAdsList>      
            </div>
        </div>
        
    </AuthenticatedLayout>
</template>