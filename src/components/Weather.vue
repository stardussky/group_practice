<template>
  <div class="weather">
    <img
      v-if="weatherIcon"
      :src="`${require('@/assets/icon/' + weatherIcon + '.svg')}`"
    >
    <div>
      <p>{{ temperature }}°</p>
      <p>桃園市</p>
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
      // let startHours = hours >= 21 ? 21 : hours
      // let endHours = startHours + 3
      navigator.geolocation.getCurrentPosition(position => {
        latitude.value = position.coords.latitude
        longitude.value = position.coords.longitude
      }, err => {
        console.log(err)
      })
      // let url = `https://opendata.cwb.gov.tw/api/v1/rest/datastore/F-D0047-089?Authorization=CWB-B129D5C9-1F5D-482E-988B-20A0637F769C&format=JSON&elementName=Wx,T&timeFrom=${year}-${month}-${day}T${startHours}%3A00%3A00&timeTo=${year}-${month}-${day}T${endHours}%3A00%3A00`
      let url = `https://opendata.cwb.gov.tw/api/v1/rest/datastore/F-D0047-089?Authorization=CWB-B129D5C9-1F5D-482E-988B-20A0637F769C&format=JSON&elementName=Wx,T&timeFrom=${year}-${month}-${day}T${hours}%3A00%3A00`
      await fetch(url)
        .then(res => res.json())
        .then(json => {
          weatherStatus.value = json.records.locations[0].location[19].weatherElement[0].time[0].elementValue[0].value
          temperature.value = json.records.locations[0].location[19].weatherElement[1].time[0].elementValue[0].value
        }).catch(err => console.log(err))
    })
    return {
      latitude,
      longitude,
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
