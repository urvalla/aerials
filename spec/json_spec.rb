require File.dirname(__FILE__) + '/spec_helper.rb'
require 'json'

describe Aerials do
  context 'create_json' do
    {
        'string array' => [
            ['val_a', 'val_b'],
            ['val_a', 'val_b']
        ],
        'symbol array' => [
            [:val_a, :val_b],
            ['val_a', 'val_b']
        ],
        'mixed array' => [
            ['val_a', :val_b],
            ['val_a', 'val_b']
        ],
        'string hash' => [
            {'b' => 'c', 'c' => 'z', 'a' => 'g'},
            {'b' => 'c', 'c' => 'z', 'a' => 'g'}
        ],
        'hash with symbol keys' => [
            {:b => 'c', :c => 'z', :a => 'g'},
            {'b' => 'c', 'c' => 'z', 'a' => 'g'}
        ],
        'symbol hash' => [
            {:b => :c, :c => :z, :a => :g},
            {'b' => 'c', 'c' => 'z', 'a' => 'g'}
        ],
        'nested' => [
            {:b => :c, 'c' => [:z, 'y'], :a => {:g => :d}},
            {'b' => 'c', 'c' => ['y', 'z'], 'a' => {'g' => 'd'}},
        ]
    }.each do |type, struct|
      it "creates parsable json from #{type}" do
        expect(JSON.parse(Aerials.create_json struct[0])).to eq struct[1]
      end
    end
  end
end