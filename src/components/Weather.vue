<template>
  <div class="weather">
    <img
      v-if="weatherIcon"
      :src="`${require('@/assets/icon/' + weatherIcon + '.svg')}`"
    >
    <div>
      <p v-show="temperature">
        {{ temperature }}°
      </p>
      <p>{{ city }}</p>
    </div>
  </div>
</template>

<script>
import { ref, computed, onMounted } from '@vue/composition-api'
export default {
  name: 'Weather',
  props: {
    weather: {
      type: String,
      required: true
    }
  },
  setup (props, { emit }) {
    const latitude = ref(null)
    const longitude = ref(null)
    const city = ref(null)
    const temperature = ref(null)
    const weatherIcon = ref(null)
    const weatherStatus = computed({
      get () {
        return props.weather
      },
      set (val) {
        if (val) {
          if (val.indexOf('雨') !== -1) {
            weatherIcon.value = 'rainy'
            emit('update:weather', 'rainy')
          } else if (val.indexOf('陰') !== -1) {
            weatherIcon.value = 'cloudy'
            emit('update:weather', 'cloudy')
          } else {
            if (new Date().getHours() >= 18) {
              weatherIcon.value = 'night'
              emit('update:weather', 'night')
            } else {
              weatherIcon.value = 'day'
              emit('update:weather', 'day')
            }
          }
        }
      }
    })
    onMounted(async () => {
      let date = new Date()
      let year = date.getFullYear()
      let month = (date.getMonth() + 1) < 10 ? '0' + (date.getMonth() + 1) : (date.getMonth() + 1)
      let day = date.getDate() < 10 ? '0' + date.getDate() : date.getDate()
      let hours = date.getHours() < 10 ? '0' + date.getHours() : date.getHours()
      await fetch('https://www.googleapis.com/geolocation/v1/geolocate?key=AIzaSyA2SdyR68TRwlCpjP92jyOhsSoFYFpKFCU', {
        method: 'POST',
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json'
        }
      })
        .then(res => res.json())
        .then(json => {
          latitude.value = json.location.lat
          longitude.value = json.location.lng
        })
        .catch(err => console.log(err))
      city.value = await fetch(`https://maps.googleapis.com/maps/api/geocode/json?key=AIzaSyA2SdyR68TRwlCpjP92jyOhsSoFYFpKFCU&latlng=${latitude.value},${longitude.value}`)
        .then(res => res.json())
        .then(json => json.results.map(res => res.address_components.find(info => info.types.includes('administrative_area_level_1') || info.types.includes('administrative_area_level_2')))[0].long_name)
        .catch(err => console.log(err))
      fetch(`https://opendata.cwb.gov.tw/api/v1/rest/datastore/F-D0047-089?Authorization=CWB-B129D5C9-1F5D-482E-988B-20A0637F769C&format=JSON&elementName=Wx,T&locationName=${encodeURI(city.value)}&timeFrom=${year}-${month}-${day}T${hours}%3A00%3A00`)
        .then(res => res.json())
        .then(json => {
          weatherStatus.value = json.records.locations[0].location[0].weatherElement[0].time[0].elementValue[0].value
          temperature.value = json.records.locations[0].location[0].weatherElement[1].time[0].elementValue[0].value
        })
        .catch(err => {
          console.log(err)
          city.value = '無法取得目前天氣'
        })
    })
    return {
      latitude,
      longitude,
      city,
      weatherIcon,
      temperature
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
    top: 7.5px;
    left: 110px;
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
