<script setup>
    import { router} from '@inertiajs/vue3';
    import Swal from 'sweetalert2';

    const props = defineProps({
        data: Object,
    });

    function formattingNum(numValue) {
        numValue = numValue.toString();
        let num = numValue.match(/^(.*?)((?:[,.]\d+)?|)$/);
        if (num) {
            let formattingNum = num[1].replace(/\B(?=(?:\d{3})*$)/g, " ") + num[2];
            return formattingNum;
        }
        else {
            return num;
        }
    };

    function getImgUrl(fileName) {
        return "/@imagetools/" + fileName;
    };

    function getUpdateUrl(adId) {
        return "/my_ads/" + adId + "/edit";
    };

    async function deleteAd(id) {
        await router.delete("/my_ads/" + id);
    };

    function showAlertDelete(event) {
        let buttonDelete = event.target;
        let adBox        = buttonDelete.closest(".adBox");
        let adTitle      = adBox.querySelector(".title").textContent;
        let id           = adBox.dataset.adId;
        Swal.fire({
            title: 'Вы уверены, что хотите удалить объявление ' + '"' + adTitle + '"' + '?',
            text: "Вы не сможете восстановить данное объявление!",
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#d33',
            cancelButtonColor: '#0EA5E9',
            confirmButtonText: 'Да, удалить!',
            cancelButtonText: 'Закрыть'
            }).then((result) => {
            if (result.isConfirmed) {
                deleteAd(id);
                Swal.fire({
                    title: 'Объявление удалено!',
                    icon: 'success',
                    confirmButtonColor: '#0EA5E9'
                })
            }
        })
    };

</script>

<template>

    <!--MyAdsList--> 

        <div class="fotoAndTel" id="fotoAndTel">
            <img class="myAdImg" id="adImg" :src="getImgUrl(data.picture)" :alt="data.title">
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
                <div class="salesmanCityBlock">
                    <div class="salesmanCity" id="salesmanCity">Местоположение:</div>
                    <div class="salesmanCityValue" id="salesmanCityValue">{{ data.city }}</div>
                </div>
            </div>
            
            <div class="buttons" id="buttons">
                <form method="get" id="formChange" :action="getUpdateUrl(data.id)">
                    <button type="submit" id="buttonChange" class="buttonChange">Изменить</button>
                </form>
                <button @click="showAlertDelete" id="buttonDelete" class="buttonDelete">Удалить</button>
            </div>
        </div>

</template>

