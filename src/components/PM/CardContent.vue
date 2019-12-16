<template>
  <div class="cardContent">
    <div class="card_head">
      代辦事項
    </div>
    <TodoCard />
  </div>
</template>

<script>
import TodoCard from './TodoCard'
export default {
  name: 'CardContent',
  components: {
    TodoCard
  }
}
</script>

<style lang='scss'>
@import '@/style/_var';
.cardContent {
  width: 300px;
  height: 90%;
  border-radius: 20px;
  background-color: rgba($white, .5);
  overflow-x: hidden;
  .card_head {
    width: 100%;
    height: 50px;
    background-color: $primary;
    color: $white;
    @include font(2);
    display: flex;
    justify-content: center;
    align-items: center;
  }
}
</style>
