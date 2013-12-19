class Detail < ActiveRecord::Base
  attr_accessible :user_id, :last_on, :height, :body_type, :diet, :smokes,
   :drinks, :drugs, :religion, :sign, :education, :job, :offspring, :pets

  before_validation :set_last_login

  validates :user, presence: true #add scoped uniqueness check?
  validates :last_on, presence: true
  validates :height, allow_blank: true, numericality: { less_than: 96, greater_than: 36 }

  ACCEPTABLES = { body_type: ["Thin", "Overweight", "Average", "Fit"], diet:
    ["Anything", "Vegetarian", "Vegan", "Kosher", "Halal", "Other"], smokes:
    ["Yes", "No", "When drinking", "Trying to quit"], drinks: ["Often",
    "Socially", "Sometimes", "Rarely", "Never"], drugs: ["Often",
    "Sometimes", "Rarely", "Never"], religion: ["Agnosticism", "Atheism",
    "Buddhism", "Christianity", "Hinduism", "Islam", "Judaism", "Other"], sign:
    ["Aquarius", "Pisces", "Aries", "Taurus", "Gemini", "Cancer", "Leo",
    "Virgo", "Libra", "Scorpio", "Sagittarius", "Capricorn"], education:
    ["Grade School", "High School", "College", "Graduate School"], job:
    ["Student", "Administrative", "Artist", "Banking", "Computer",
    "Construction", "Education", "Hospitality", "Legal", "Management",
    "Media", "Medicine", "Military", "Political", "Sales", "Science",
    "Unemployed", "Retired", "Other"], offspring: ["Doesn't want kids",
    "Doesn't have kids, but wants them", "Has kids"], pets: ["Likes cats",
    "Likes dogs", "Likes cats and dogs"] }

  [:body_type, :diet, :smokes, :drinks, :drugs, :religion, :sign, :education,
     :job, :offspring, :pets].each do |attr|
    validates attr, inclusion: { in: ACCEPTABLES[attr] }, allow_blank: true
  end

  belongs_to :user

  private
  def set_last_login
    self.last_on ||= Time.now
  end
end