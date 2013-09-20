class ContactsController < ApplicationController
  def index
    @page = Page.contacts
  end
end
