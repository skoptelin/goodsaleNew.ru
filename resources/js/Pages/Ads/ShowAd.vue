<script setup>
    import AuthenticatedLayout from '@/Layouts/AuthenticatedLayout.vue';
    import { Head } from '@inertiajs/vue3';

    const props = defineProps({
        Ad: Object,
    });

    function showTelNum(event) {
        let button       = event.target;
        let hiddenButton = button.classList.add("adButtonHidden");
        let adBox        = button.closest(".adBoxDetail");
        let telNum       = adBox.querySelector(".adTelDetail");
        telNum.classList.remove("adTelHidden");
        
        if (telNum.textContent == "") {
        telNum.innerHTML = "№ телефона не указан";
        }
    };

    function formattingNum(numValue) { // Форматирование чисел: добавить пробелы между разрядами до точки или запятой
        numValue = numValue.toString();
        let num = numValue.match(/^(.*?)((?:[,.]\d+)?|)$/);
        if (num) {
            let formattingNum = num[1].replace(/\B(?=(?:\d{3})*$)/g, ' ') + num[2];
            return formattingNum;
        } else {
            return num;
        }
    };

    function getImgUrl(fileName) {
        return '/@imagetools/' + fileName;
    };

</script>

<template>
    <Head title="Детали объявления" />

    <AuthenticatedLayout> 
        <div :data-id="Ad.id" class="adBoxDetail" id="adBox">

            <div class="adTitleDetail">{{ Ad.title }}</div>

            <div class="fotoAndTelDetail" id="fotoAndTel">
                <div>
                    <img class="adImgDetail" id="adImg" :src="getImgUrl(Ad.picture)">
                </div>

                <div class="adDetail">
                    <div class="adPriceDetail" id="adPrice">
                        <div class="priceValueDetail" id="priceValue">{{ formattingNum(Ad.price) }}</div>
                        <div class="currencyDetail" id="currency">₽</div>
                    </div>
                    <div class="salesmanInfoDetail" id="salesmanInfo">
                        <div class="salesmanNameBlockDetail">
                            <div class="salesmanTitleDetail" id="salesmanTitle">Продавец: </div>
                            <div class="salesmanValueDetail" id="salesmanValue">{{ Ad.user.name }}</div>
                        </div>
                        <div class="salesmanCityBlockDetail">
                            <div class="salesmanCityDetail" id="salesmanCity">Местоположение:</div>
                            <div class="salesmanCityValueDetail" id="salesmanCityValue">{{ Ad.city }}</div>
                        </div>
                    </div>
                    <div class="adTelDetail adTelHidden" id="adTel">{{ Ad.user.phone_num }}</div>
                    <button @click="showTelNum" id="adButton" class="adButtonDetail">Показать телефон</button>
                </div>
            </div>  

            <div class="description" id="description">{{ Ad.description }}</div>
        </div>
    </AuthenticatedLayout>

</template>

