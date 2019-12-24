<template>
  <ValidationProvider
    v-slot="{errors}"
    class="inputComponent"
    tag="div"
    :rules="rules"
  >
    <label>
      <input
        v-model="inputValue"
        :type="type"
        :name="name"
        :placeholder="placeholder"
        autocomplete="off"
      >
      <p>{{ field }}</p>
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
.inputComponent {
  width: 250px;
  height: 70px;
  ::-webkit-input-placeholder{
    color: $white;
    text-align: center;
    opacity: 0;
    transition: opacity .3s;
  }
  >label {
    display: block;
    height: 40px;
    position: relative;
    @include font(1);
    z-index: 1;
    cursor: pointer;
    >input{
      width: 100%;
      @include btnReset;
      @include font;
      color: $dark;
      position: absolute;
      left: 0;
      bottom: 0;
      padding: 0 5px;
      &:focus{
        color: $white;
        &::-webkit-input-placeholder{
          opacity: 1;
        }
        +p {
          color: $white;
        }
        ~span {
          height: 100%;
          transform:scaleY(1);
        }
      }
    }
    >p {
      position: absolute;
      top: 0;
      left: 0;
      padding: 0 5px;
      color: $dark;
      font-weight: 600;
    }
    >span{
      display: inline-block;
      position: absolute;
      left: 0;
      bottom: 0;
      width: 100%;
      height: 2px;
      background-color: $primary;
      border-radius: 5px;
      z-index: -1;
      transition: height .3s, background-color .5s;
      transform:scaleY(0.5);
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
    height: 60px;
  }
}
</style>
