<template>
  <b-container class="p-3" id="container">
    <b-form @submit="onSubmit">
      <b-form-group
        id="input-group-1"
        label="Email address:"
        label-for="input-1"
        description="We'll never share your email with anyone else."
      >
        <b-form-input
          id="input-1"
          v-model="form.email"
          type="email"
          placeholder="Enter email"
          required
        ></b-form-input>
      </b-form-group>

      <b-form-group label="Password" label-for="loginpassword">
        <b-form-input
          id="loginpassword"
          v-model="form.password"
          placeholder="Enter name"
          type="password"
          required
        ></b-form-input>
        <b-form-invalid-feedback :state="pwValidation">
          Your password must
          <ul>
            <li>be 5-12 characters long</li>
            <li><strike>contain 1 ml of blood 🗡</strike></li>
          </ul>
        </b-form-invalid-feedback>
        <b-form-valid-feedback :state="pwValidation">
          &lt;borat&gt;Veh-ry niice&lt;/borat&gt;
        </b-form-valid-feedback>
      </b-form-group>

      <b-button type="submit" variant="primary">Submit</b-button>
    </b-form>
  </b-container>
</template>

<script>
export default {
  data() {
    return {
      name: "",
      form: {
        email: "",
        password: ""
      }
    };
  },
  computed: {
    pwValidation() {
      return this.form.password.length > 4 && this.form.password.length < 13;
    }
  },
  methods: {
    onSubmit(event) {
      event.preventDefault();
    },
    onReset(event) {
      event.preventDefault();
      // Reset our form values
      this.form.email = "";
      this.form.name = "";
    }
  }
};
</script>

<style scoped>
#container {
  border: 1px solid #666;
  border-radius: 5px;
  box-shadow: 3px 3px 3px #999;
}
</style>
