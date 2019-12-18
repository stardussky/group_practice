<template>
  <div class="cardContent">
    <div class="card_head">
      代辦事項
    </div>
    <div class="card_body">
      <TodoCard />
    </div>
  </div>
</template>

<script>
import TodoCard from './module/TodoCard'
export default {
  name: 'CardContent',
  components: {
    TodoCard
  }
}
</script>

<style lang='scss'>
@import '@/style/_card';
.cardContent {
  width: 300px;
  height: 90%;
  border-radius: 20px;
  background-color: rgba($white, .5);
  overflow-x: hidden;
  margin: 0 10px;
  .card_head {
    @include cardHead;
  }
  .card_body {
    height: calc(100% - 50px);
    overflow-y: auto;
  }
}
</style>
