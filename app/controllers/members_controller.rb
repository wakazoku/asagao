class MembersController < ApplicationController
	before_action :login_required

	# 会員一覧
	def index
		@members = Member.order("number")
	end

	# 検索
	def search
		@members = Member.search(params[:q])
		render "index"
	end

	# 会員情報の詳細
	def show
		@member = Member.find(params[:id])
	end

	# 新規作成フォーム
	def new
		@member = Member.new(birthday: Date.new(1980, 1, 1))
	end

	# 更新フォーム
	def edit
		@member = Member.find(params[:id])
	end

  # 会員の新規登録
	def create
		@member = Member.new(member_params)
		if @member.save
			redirect_to @member, notice: "会員情報を登録しました"
		else
			render "new"
		end
	end

  # 会員情報の更新
	def update
		@member = Member.find(params[:id])
		@member.assign_attributes(member_params)
		if @member.save
			redirect_to @member, notice: "会員情報を更新しました"
		else
			render "edit"
		end
	end

	def destroy
		@member = Member.find(params[:id])
		@member.destroy
		redirect_to :members, notice: "会員を削除しました"
	end

  private
	# 管理者の場合はmemberモデルに管理者シンボルを追加し、値を更新する。
	# ストロングパラメータ対応。
	  def member_params
			attrs = [:number, :name, :fullname, :gender, :birthday, :email,
			         :password, :password_confirmation]
			# もし管理者なら配列attrにシンボルadministratorを追加。if文を1行で記述。
			attrs << :administrator if current_member.administrator?
			# require #=> :memberが空の場合にnilを返す。
			params.require(:member).permit(attrs)
		end



end
