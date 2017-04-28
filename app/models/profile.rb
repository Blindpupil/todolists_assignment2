class Profile < ActiveRecord::Base
  belongs_to :user
  validates :gender,
            inclusion: { within: %w[male female],
                         message: "%{value} is not a valid gender, sorry" }
  validate :not_both_names_nil, :no_lgbtq_tolerance

  def not_both_names_nil
    errors.add(:first_name, "first and last name can't be both nil") if
        first_name.nil? && last_name.nil?
  end

  def no_lgbtq_tolerance
    errors.add(:first_name, "no male Sue's, sorry it's the teacher not me") if
        gender == 'male' && first_name == "Sue"
  end

  def self.get_all_profiles(min_birth_year, max_birth_year)
    Profile.where('birth_year BETWEEN :min_year AND :max_year',
                  min_year: min_birth_year, max_year: max_birth_year)
           .order(birth_year: :asc)
  end

end
