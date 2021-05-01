module FriendshipsHelper
  # rubocop:disable Metrics/CyclomaticComplexity
  def send_request(user)
    if current_user.friend?(user) || user.friend?(user)
      concat link_to 'Remove friend', remove_friend_path(user),
                     data: { confirm: 'Are you sure you want to remove this request?' }
    elsif current_user.friend_requests.include?(user)
      concat link_to 'Accept', confirm_request_path(user), class: 'btn btn-success'
      concat '   '
      concat link_to 'Reject', reject_request_path(user), class: 'btn btn-danger'

    elsif current_user.pending_friends.none?(user) && !current_user.friend?(user) && current_user != user
      concat link_to 'Invite to friendship', friend_request_path(user), class: 'profile-link text-primary'
    end
  end
  # rubocop:enable Metrics/CyclomaticComplexity
end
