tldr.controller 'ArticleCtrl', ['$scope', '$http',
  ($scope, $http) ->
    $http.get('/recent.json').then (res) =>
      $scope.articles = res.data
      _.each $scope.articles, (article) ->
        article.data.summary = JSON.parse(article.data.summary)
]
