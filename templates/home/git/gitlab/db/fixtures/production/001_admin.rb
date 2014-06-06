admin = User.create(
  email: "{{ gitlab_admin_email }}",
  name: "{{ gitlab_admin_name }}",
  username: '{{ gitlab_admin_username }}',
  password: "{{ gitlab_admin_password }}",
  password_confirmation: "{{ gitlab_admin_password }}",
  theme_id: {{ gitlab_admin_theme_id }}

)

admin.projects_limit = 10000
admin.admin = true
admin.save!
admin.confirm!

if admin.valid?
puts %q[
Administrator account created:

login.........{{ gitlab_admin_email }}
password......**********
]
end
