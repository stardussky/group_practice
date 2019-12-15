<template>
  <ValidationProvider
    v-slot="{errors}"
    class="inputComponent"
    tag="div"
    :rules="rules"
  >
    <label>{{ field }}
      <input
        v-model="inputValue"
        :type="type"
        :name="name"
        :placeholder="placeholder"
        autocomplete="off"
      >
      <span :class="{invalid: errors.length}" />
    </label>
    <p class="error">
      {{ errors[0] }}
    </p>
  </ValidationProvider>
</template>

<script>
import { computed } from '@vue/composition-api'
export default {
  name: 'InputComponent',
  props: {
    name: {
      type: String,
      required: true
    },
    value: {
      type: String,
      required: true
    },
    placeholder: {
      type: String,
      required: true
    },
    rules: {
      type: String,
      required: true
    },
    type: {
      type: String,
      required: true
    },
    field: {
      type: String,
      required: true
    }
  },
  setup (props, { emit }) {
    const inputValue = computed({
      get () {
        return props.value
      },
      set (val) {
        emit('input', val)
      }
    })
    return {
      inputValue
    }
  }
}
</script>

<style lang='scss'>
@import '@/style/_var';
.inputComponent {
  width: 250px;
  height: 70px;
  margin: auto;
  ::-webkit-input-placeholder{
    @include font;
    color: $white;
    text-align: center;
    opacity: 0;
    transition: opacity .3s;
  }
  >label {
    display: block;
    position: relative;
    @include font(1);
    color: $white;
    padding: 0 5px;
    >input{
      width: 100%;
      @include btnReset;
      color: $white;
      @include font;
      &:focus{
        &::-webkit-input-placeholder{
          opacity: 1;
        }
        +span {
          height: 100%;
        }
      }
    }
    >span{
      display: inline-block;
      position: absolute;
      left: 0;
      bottom: 0;
      width: 100%;
      height: 1px;
      background-color: $primary;
      z-index: -1;
      transition: height .3s, background-color .5s;
      &.invalid {
        background-color: $danger;
      }
    }
  }
  .error {
    color: $danger;
    font-weight: 700;
    @include font;
  }
  @include media(479px){
    width: 100%;
  }
}
</style>
