<template>
  <div class="shop_view">
    <div class="item_introduction">
      <h2>New Collection</h2>
      <p>Lorem ipsum dolor, sit amet consectetur adipisicing elit.</p>
      <button>Shop</button>
    </div>
  </div>
</template>

<script>
export default {
  name: 'ShopView'
}
</script>

<style lang='scss'>
.shop_view {
  width: 100%;
  height: 100%;
  background-image: url('https://images.unsplash.com/photo-1562887085-cb16e9116582?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1778&q=80');
  background-position: center;
  background-size: cover;
  border-radius: 0 0 20px 20px;
  padding-top: 50px;
  .item_introduction {
    width: 40%;
    min-width: 300px;
    background-color: rgba($white, .3);
    box-shadow: 1px 1px 3px $shadow;
    padding: 30px;
    color: $textDark;
    h2 {
      @include font(10);
      margin-bottom: 10px;
    }
    p {
      @include font;
      margin-bottom: 20px;
    }
    button {
      @include baseBtn;
    }
  }
}
</style>
