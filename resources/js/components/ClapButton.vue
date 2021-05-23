<template>
    <div>
        <span class="clap-btn" v-on:click="likeReceta" :class="{ 'clap-active' : this.like }"></span>

        <p>{{ cantidadLikes }} les gustó esta receta</p>
    </div> 
</template>

<script>
    export default {
        props: ['recetaId', 'like', 'likes'],
        mounted() {
            console.log(this.like)
        },
        data: function () {
            return {
                totalLikes: this.likes,
                isActive: this.like
            }
        },
        methods: {
            likeReceta() {
                axios.post(`/recetas/${this.recetaId}`)
                    .then(respuesta => {
                        if (respuesta.data.attached.length > 0) {
                            this.$data.totalLikes++;
                        } else {
                            this.$data.totalLikes--;
                        }

                        this.isActive = !this.isActive;
                    })
                    .catch(error => {
                        if (error.response.status === 401) {
                            window.location = '/register'
                        }
                    })
            }
        },
        computed: {
            cantidadLikes: function () {
                return this.totalLikes;
            }
        }
    }
</script>