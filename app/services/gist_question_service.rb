class GistQuestionService

  ACCESS_TOKEN = Rails.application.credentials.github[:api_token]

  Result = Struct.new(:response) do
    def success?
      response.html_url.present?
    end

    def url
      response.html_url
    end
  end

  def initialize(question, client = default_client)
    @question = question
    @client = client
  end

  def call
    Result.new @client.create_gist(gist_params)
  end

  private

  def gist_params
    {
      description: I18n.t('admin.gists.description', test_title: @question.test.title),
      files: {
        'test-guru-question-txt' => {
          content: gist_content
        }
      }
    }
  end

  def gist_content
    [@question.text, *@question.answers.pluck(:text)].join("\n")
  end

  def default_client
    Octokit::Client.new(access_token: ACCESS_TOKEN)
  end
end
