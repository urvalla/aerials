require File.dirname(__FILE__) + '/spec_helper.rb'

describe Aerials do
  context 'create_json' do
    {
        'string keys & vals' => {'key_a' => 'val_a', 'key_b' => 'val_b'},
        'symbol keys' => {:key_a => 'val_a', :key_b => 'val_b'},
        'symbol keys & vals' => {:key_a => :val_a, :key_b => :val_b}
    }.each do |type, struct|
      it "processes plain hash with #{type} correctly" do
        expect(Aerials.create_json struct).to eq "{'key_a':'val_a','key_b':'val_b'}"
      end
    end

    {
        'string vals' => ['val_a', 'val_b'],
        'symbol vals' => [:val_a, :val_b]
    }.each do |type, struct|
      it "processes plain array with #{type} correctly" do
        expect(Aerials.create_json struct).to eq "['val_a','val_b']"
      end
    end

    it 'sorts hash keys' do
      struct = {'b' => 'c', 'c' => 'z', 'a' => 'g'}
      expect(Aerials.create_json struct).to eq "{'a':'g','b':'c','c':'z'}"
    end

    it 'sorts array' do
      struct = ['b', 'c', 'a']
      expect(Aerials.create_json struct).to eq "['a','b','c']"
    end

    it 'processes nested hash' do
      struct = { 'key_a' => 'val_a',
                 'key_b' => { 'key_d' => 'val_d', 'key_c' => 'val_c'},
                 'key_e' => 'val_e' }
      expect(
          Aerials.create_json struct
      ).to eq "{'key_a':'val_a','key_b':{'key_c':'val_c','key_d':'val_d'},'key_e':'val_e'}"
    end

    it 'processes nested array' do
      struct = { 'key_a' => 'val_a',
                 'key_b' => ['val_d', 'val_c'],
                 'key_e' => 'val_e' }
      expect(
          Aerials.create_json struct
      ).to eq "{'key_a':'val_a','key_b':['val_c','val_d'],'key_e':'val_e'}"
    end

    it 'quotes numbers in array' do
      struct = [1, 2]
      expect(Aerials.create_json struct).to eq "['1','2']"
    end

    it 'quotes numbers' do
      struct = { 1 => 2, 3 => 4 }
      expect(Aerials.create_json struct).to eq "{'1':'2','3':'4'}"
    end

    it 'excludes keys' do
      struct = {'b' => 'c', 'c' => 'z', 'a' => 'g', 'd' => 'e'}
      expect(Aerials.create_json struct, exclude: ['c', 'd']).to eq "{'a':'g','b':'c'}"
    end
  end
end