class ReviewsController < ApplicationController
  before_action :find_restaurant
  def new
    @review = Review.new
  end

  def create
    # this instance of review is created with validation errors
    @review = Review.new(review_params)
    # we need to associate our review to a restaurant(restaurant_id)
    # because so far this is what we have: <Review id: nil, rating: 5, content: "amazing", restaurant_id: nil, created_at: nil, updated_at: nil>
    # in the console: new_review.restaurant = eatery
    @review.restaurant = @restaurant
    # if not empty due to validations it will save. then:
    # raise
    if @review.save
      redirect_to restaurant_path(@restaurant)
    else
      # we will stay in the create action but will display the template of the new page
      # the only difference is that i am not using the "new" instance of @review, i am
      # using the instance of review that failed to save.
      # we can look at this instance on rails c using new_review.errors.messages
      # simple form handles that
      # render renders some html, it renders a page
      # if THE SAVE fails it will render a new page, and what is this new page?
      # essentially my form.
      # this instance of @review has validations and will show errors
      # renders the "new" route, a new form
      render :new
    end
  end

  private

  def find_restaurant
    # in our routes for reviews it is :restaurant_id
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end