describe Logicware::Configurable do
  it "implements define method" do
    expect(Logicware::Configurable).respond_to?(:define)
  end

  it "implements set method for config instance" do
    Logicware::Configurable.define do |config|
      expect(config).respond_to?(:set)
    end
  end

  describe "configuration validations" do
    context "general validations" do
      let(:default_var) { 'Foobar' }

      it "defines a configuration variable" do
        Logicware::Configurable.define do |config|
          config.set(:string_config, default_var)
        end

        expect(Logicware::Configurable.config.string_config).not_to be nil
        expect(Logicware::Configurable.config.string_config).to eq default_var
      end

      it "defines a configuration variable with values validation" do
        Logicware::Configurable.define do |config|
          config.set(:string_config, default_var, values: ['Foobar'])
        end

        expect(Logicware::Configurable.config.string_config).not_to be nil
        expect(Logicware::Configurable.config.string_config).to eq default_var
      end

      it "defines a configuration variable with regex validation" do
        Logicware::Configurable.define do |config|
          config.set(:string_config, default_var, regex: /^[A-z]{2,6}$/)
        end

        expect(Logicware::Configurable.config.string_config).not_to be nil
        expect(Logicware::Configurable.config.string_config).to eq default_var
      end

      it "default is not in the values validation" do
        Logicware::Configurable.define do |config| 
          expect {config.set(:string_config, default_var, values: ['bar', 'baz', 'foo']) }.to raise_error Logicware::Configurable::Error
        end
      end

      it "default doesnt fit in the regex validation" do
        Logicware::Configurable.define do |config| 
          expect{ config.set(:string_config, default_var, regex: /^[A-z]{2,4}$/) }.to raise_error Logicware::Configurable::Error
        end
      end
    end

    context "type validations" do
      context "array type" do
        let(:default_var) { 'foobar,foo,bar,baz,qux,quux,quuz' }
        let(:config_result) { ['foobar','foo','bar','baz','qux','quux','quuz'] }

        it "defines a configuration variable with type array" do
          Logicware::Configurable.define do |config|
            config.set(:array_config, default_var, type: :array)
          end

          expect(Logicware::Configurable.config.array_config).not_to be nil
          expect(Logicware::Configurable.config.array_config).to eq config_result
        end
      end

      context "bool type" do
        let(:default_var) { 'true' }
        let(:config_result) { true }
        
        it "defines a configuration variable with type bool" do
          Logicware::Configurable.define do |config|
            config.set(:bool_config, default_var, type: :bool)
          end

          expect(Logicware::Configurable.config.bool_config).not_to be nil
          expect(Logicware::Configurable.config.bool_config).to eq config_result
        end
      end

      context "integer type" do
        let(:default_var) { '42' }
        let(:config_result) { 42 }
    
        it "defines a configuration variable with type integer" do
          Logicware::Configurable.define do |config|
            config.set(:int_config, default_var, type: :integer)
          end

          expect(Logicware::Configurable.config.int_config).not_to be nil
          expect(Logicware::Configurable.config.int_config).to eq config_result
        end
      end

      context "regexp type" do
        let(:default_var) { '^(?=.*[[:lower:]])(?=.*[[:upper:]])(?=.*[[:digit:]])(?=.*[[:graph:]]).{8,80}$' }
        let(:config_result) { /^(?=.*[[:lower:]])(?=.*[[:upper:]])(?=.*[[:digit:]])(?=.*[[:graph:]]).{8,80}$/ }
  
        it "defines a configuration variable with type regexp" do
          Logicware::Configurable.define do |config|
            config.set(:regexp_config, default_var, type: :regexp)
          end
  
          expect(Logicware::Configurable.config.regexp_config).not_to be nil
          expect(Logicware::Configurable.config.regexp_config).to eq config_result
        end
      end

      context "path type" do
        let(:root) { Pathname.new('..').expand_path(File.dirname(__FILE__)) }
        let(:default_var) { root.join('spec', 'config_spec.rb').to_s }
        let(:dummy_var) { root.join('spec', 'dummy_spec.rb').to_s }
        let(:config_result) { root.join('spec', 'config_spec.rb') }
  
        it "defines a configuration variable with type path" do
          Logicware::Configurable.define do |config|
            config.set(:path_config, default_var, type: :path)
          end
  
          expect(Logicware::Configurable.config.path_config).not_to be nil
          expect(Logicware::Configurable.config.path_config).to eq config_result
        end

        it "throws error if file doesnt exist as a path" do
          Logicware::Configurable.define do |config|
            expect{ config.set(:path_config, dummy_var, type: :path) }.to raise_error Logicware::Configurable::Error
          end
        end
      end
    end
  end
end
