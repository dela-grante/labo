<template>
  <div class="inquiry">
    <el-form ref="form" :model="form" label-width="100px" :rules="rules">
    <el-form-item prop="global_id">
        <el-input
          v-model="form.global_id"
          placeholder="グローバルID"
          type="tel">
        </el-input>
    </el-form-item>
    <el-form-item prop="name">
        <el-input
          v-model="form.name"
          placeholder="お名前">
        </el-input>
    </el-form-item>
    <el-form-item prop="content">
        <el-input
          type="textarea"
          :autosize="{ minRows: 5, maxRows: 10}"
          placeholder="お問い合わせ内容を入力してください。"
          v-model="form.content">
        </el-input>
    </el-form-item>
    </el-form>
    <el-button type="primary" round>送信</el-button>
  </div>
</template>

<script>
export default {
  name: 'Inquiry',
  data () {
    return {
      form: {
        global_id: '',
        name: '',
        content: ''
      },
      rules: {
        global_id: [
          { required: true, message: '入力必須です。', trigger: 'blur' },
          // { type: "integer", message: '数字で入力してください。', trigger: 'blur' },
          { len: 10, message: '10桁で入力してください。', trigger: 'blur' }
        ],
        name: [
          { required: true, message: '入力必須です。', trigger: 'blur' }
        ],
        content: [
          { required: true, message: '入力必須です。', trigger: 'blur' }
        ]
      }
    }
  },
  methods: {
  }
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style>
</style>
