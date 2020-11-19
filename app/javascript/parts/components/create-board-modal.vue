<template>
    <div :class="{'is-active': value}">

    </div>
</template>

<script>
export default {
    props: ['value'],
    methods: {
        toggle: () => {
            this.value = !this.value;
        }
    }
}
</script>

<style>

</style>