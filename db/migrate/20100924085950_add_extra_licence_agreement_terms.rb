class AddExtraLicenceAgreementTerms < ActiveRecord::Migration
  def self.up
    add_column :customers, :non_commercial, :boolean
    add_column :customers, :understand_collaboration, :boolean
  end

  def self.down
    remove_column :customers, :non_commercial
    remove_column :customers, :understand_collaboration
  end
end
