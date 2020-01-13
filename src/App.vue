<template>
  <div id="app">
    <router-view />
    <vue-progress-bar />
  </div>
</template>

<style lang='scss'>
@import url('https://fonts.googleapis.com/css?family=Montserrat:400,600|Noto+Sans+TC:300,700&display=swap');
*{
  margin: 0;
  padding: 0;
  box-sizing: border-box;
}
body, html {
  font-family: 'Montserrat', 'Noto Sans TC', sans-serif;
  overflow-x: hidden;
}
</style>
