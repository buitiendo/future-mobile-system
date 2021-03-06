class Admin::AccountsController < Admin::BaseController
  before_action :load_account, except: %i(new index create)

  def index
    @q = Account.ransack params[:q]
    @accounts = @q.result.page(params[:page])
      .per Settings.size.size_page_admin
  end

  def new
    @account = Account.new
  end

  def create
    @account = Account.new account_params
    if @account.save
      flash[:success] = t "successfully_create"
      redirect_to admin_accounts_url
    else
      render :new
    end
  end

  def show; end

  def edit; end

  def update
    if @account.update account_params
      flash[:success] = t "successfully_update"
      redirect_to admin_accounts_url
    else
      render :edit
    end
  end

  def destroy
    begin
      @account.destroy!
      flash[:success] = t "account_delete"
    rescue
      flash[:danger] = t "cannot_remove_account"
    end
    redirect_to admin_accounts_url
  end

  private

  def account_params
    params.require(:account).permit :fullname, :address, :phone, :email,
      :image, :account_type, :password, :password_confirmation
  end

  def load_account
    @account = Account.find_by id: params[:id]
    return if @account.present?
    flash[:danger] = t "not_account"
    redirect_to admin_accounts_url
  end
end
