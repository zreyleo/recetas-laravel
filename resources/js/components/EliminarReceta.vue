<template>
    <button 
        type="button" 
        class="mr-1 btn btn-danger flex-grow-1 d-flex align-items-center justify-content-center" 
        v-on:click="eliminarReceta"
    >
        <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6 icono-small" fill="none" viewBox="0 0 24 24" stroke="currentColor">
            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 7l-.867 12.142A2 2 0 0116.138 21H7.862a2 2 0 01-1.995-1.858L5 7m5 4v6m4-6v6m1-10V4a1 1 0 00-1-1h-4a1 1 0 00-1 1v3M4 7h16" />
        </svg>
        Eliminar
    </button>
</template>

<script>
    export default {
        props: ['recetaId'],
        methods: {
            eliminarReceta() {
                this.$swal({
                    title: '¿Estás segur@?',
                    text: "¡No podrás revertir esta acción!",
                    icon: 'warning',
                    showCancelButton: true,
                    confirmButtonColor: '#d33',
                    cancelButtonColor: '#3085d6',
                    confirmButtonText: '¡Sí, borrar!',
                    cancelButtonText: 'Cancelar'
                }).then((result) => {
                    if (result.isConfirmed) {
                        const params = {
                            id: this.recetaId
                        };

                        axios.post(`/recetas/${this.recetaId}`, { params, _method: 'delete' })
                            .then(respuesta => {
                                this.$el.parentNode.parentNode.parentNode.removeChild(this.$el.parentNode.parentNode);
                                this.$swal(
                                '¡Receta Borrada!',
                                'Has borrado tu receta.',
                                'success'
                                );
                            })
                            .catch(error => {
                                console.log(error);
                            });

                        
                    }
                })
            }
        }
    }
</script>