Rails.application.config.generators do |g|
  g.helper false 			# �w���p�[���쐬���Ȃ�
  g.assets false 			# CSS�AJavaScript�t�@�C���𐶐����Ȃ�
  g.skip_routes true		# config/routes.rb ��ύX���Ȃ�
  g.test_framework false	# �e�X�g�X�N���v�g�������Ȃ�
end