class FamilyMembersController < ApplicationController
  before_action :set_family_member, only: %i[ show  ]

  def index
    @family_members = FamilyMember.includes(:tasks)

    @pagy, @family_members = pagy(@family_members)
  end

  def show
    @pagy, @tasks = pagy(@family_member.tasks)
  end

  def new
    @family_member = FamilyMember.new

  end

  def create
    @family_member = FamilyMember.new(family_member_params)

    respond_to do |format|
      if @family_member.save
        format.html { redirect_to family_member_url(@family_member), notice: "Family member was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  private
    def set_family_member
      @family_member = FamilyMember.find(params[:id])
    end

    def family_member_params
      params.require(:family_member).permit(:name)
    end
end
