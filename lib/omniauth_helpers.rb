module OmniauthHelpers

  def set_user_params_from_twiter(user, auth)
    user.name = auth.info.name
    user.build_identity(uid: auth.uid, provider: auth.provider, profile_link: auth.info.urls.Twitter , profile_image: auth.info.image)
    user
  end

  def set_user_params_from_facebook(user, auth)
    user.name = auth.info.name
    user.build_identity(uid: auth.uid, provider: auth.provider , profile_image: auth.info.image)
    user
  end
end