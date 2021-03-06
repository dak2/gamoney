require 'application_system_test_case'

class SavingsTest < ApplicationSystemTestCase
  setup do
    @saving = savings(:one)
  end

  test 'visiting the index' do
    visit savings_url
    assert_selector 'h1', text: 'Savings'
  end

  test 'should create saving' do
    visit savings_url
    click_on 'New saving'

    fill_in 'Label', with: @saving.label
    fill_in 'Money', with: @saving.money
    fill_in 'User', with: @saving.user_id
    click_on 'Create Saving'

    assert_text 'Saving was successfully created'
    click_on 'Back'
  end

  test 'should update Saving' do
    visit saving_url(@saving)
    click_on 'Edit this saving', match: :first

    fill_in 'Label', with: @saving.label
    fill_in 'Money', with: @saving.money
    fill_in 'User', with: @saving.user_id
    click_on 'Update Saving'

    assert_text 'Saving was successfully updated'
    click_on 'Back'
  end

  test 'should destroy Saving' do
    visit saving_url(@saving)
    click_on 'Destroy this saving', match: :first

    assert_text 'Saving was successfully destroyed'
  end
end
