<template>
  <p>
    <span>{{ address.addressLineOne }}, </span>
    <span v-if="address.addressLineTwo">{{ address.addressLineTwo }}, </span>
    <span>{{ address.city }}, {{ address.state }} {{ address.zipCode }}</span>
  </p>
</template>

<script>
export default {
  name: "address-line",
  props: ["address"],
};
</script>

<style scoped>
p span {
  display: inline-block;
  font-size: 0.8rem;
}
</style>
