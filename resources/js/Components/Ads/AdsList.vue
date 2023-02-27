<script setup>

    const props = defineProps({
        data: Object,
    });

    function showTelNum(event) {
        let button       = event.target;
        let hiddenButton = button.classList.add("adButtonHidden");
        let adBox        = button.closest(".adBox");
        let telNum       = adBox.querySelector(".adTel");
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
        <!--AdsList--> 

        <div class="fotoAndTel" id="fotoAndTel">
            <img class="adImg" id="adImg" :src="getImgUrl(data.picture)">
            <div class="adTel adTelHidden" id="adTel">{{ data.phone_num }}</div>
            <button @click="showTelNum" id="adButton" class="adButton">Показать телефон</button>
        </div>  

        <div class="detail" id="detail">

            <div class="adInfo" id="adInfo">
                <div class="titleAndDiscription" id="titleAndDiscription">
                    <div class="title" id="title">{{ data.title }}</div>
                    <div class="description" id="description">{{ data.description }}</div>
                </div>
                
                <div class="adPrice" id="adPrice">
                    <div class="priceValue" id="priceValue">{{ formattingNum(data.price) }}</div>
                    <div class="currency" id="currency">₽</div>
                </div>
            </div>

            <div class="salesmanInfo" id="salesmanInfo">
                <div class="salesmanNameBlock">
                    <div class="salesmanTitle" id="salesmanTitle">Продавец: </div>
                    <div class="salesmanValue" id="salesmanValue">{{ data.name }}</div>
                </div>
                <div class="salesmanCityBlock">
                    <div class="salesmanCity" id="salesmanCity">Местоположение:</div>
                    <div class="salesmanCityValue" id="salesmanCityValue">{{ data.city }}</div>
                </div>
            </div>

        </div>

</template>

