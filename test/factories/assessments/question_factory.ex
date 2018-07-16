defmodule Cadet.Assessments.QuestionFactory do
  @moduledoc """
  Factories for the Question entity
  """

  defmacro __using__(_opts) do
    quote do
      alias Cadet.Assessments.Question

      def question_factory do
        %Question{
          title: sequence("question"),
          question: %{},
          type: Enum.random([:programming, :multiple_choice]),
          assessment: build(:assessment, %{is_published: true})
        }
      end

      def programming_question_factory do
        %{
          content: Faker.Pokemon.name(),
          solution_header: Faker.Pokemon.location(),
          solution_template: Faker.Lorem.Shakespeare.as_you_like_it(),
          solution: Faker.Lorem.Shakespeare.hamlet()
        }
      end

      def mcq_question_factory do
        %{
          content: Faker.Pokemon.name(),
          choices: Enum.map(0..2, &build(:mcq_choice, %{choice_id: &1, is_correct: &1 == 0}))
        }
      end

      def mcq_choice_factory do
        %{
          content: Faker.Pokemon.name(),
          hint: Faker.Pokemon.location()
        }
      end
    end
  end
end