<template>
  <div class="weather">
    <img src="@/assets/icon/cloudy.svg">
    <div>
      <p>20°</p>
      <p>桃園市</p>
    </div>
  </div>
</template>

<script>
import { ref, onMounted } from '@vue/composition-api'
export default {
  name: 'Weather',
  setup () {
    const latitude = ref(null)
    const longitude = ref(null)
    onMounted(() => {
      navigator.geolocation.getCurrentPosition(position => {
        latitude.value = position.coords.latitude
        longitude.value = position.coords.longitude
      }, err => {
        console.log(err)
      })
      fetch('https://opendata.cwb.gov.tw/api/v1/rest/datastore/F-D0047-089?Authorization=CWB-B129D5C9-1F5D-482E-988B-20A0637F769C&format=JSON&elementName=WeatherDescription')
        .then(res => res.json()).then(json => console.log(json))
    })
    return {
      latitude,
      longitude
    }
  }
}
</script>

<style lang='scss'>
.weather {
  position: fixed;
  bottom: 30px;
  left: 40px;
  > img {
    width: 60px;
    vertical-align: middle;
  }
  > div {
    display: inline-block;
    color: $white;
    margin-left: 10px;
    vertical-align: middle;
    > p:nth-of-type(1) {
      font-weight: 400;
      @include font(5);
    }
    > p:nth-of-type(2) {
      @include font(2);
    }
  }
  @include media(1023px){
    bottom: 10px;
    left: 10px;
    > img {
      width: 40px;
    }
    > div {
      > p:nth-of-type(1) {
        @include font;
      }
      > p:nth-of-type(2) {
        @include font;
      }
    }
  }
  @include media(479px){
    top: 45px;
    bottom: auto;
    > img {
      width: 30px;
    }
    > div {
      > p:nth-of-type(1) {
        @include font(-.875);
      }
      > p:nth-of-type(2) {
        @include font(-.875);
      }
    }
  }
}
</style>
