log-box
	div.back-log(
		onclick="{ toggleLog }"
	)
	div.inner
		comment(
			each="{ comments }"
			name="{ name }"
			icon="{ icon }"
			message="{ message }"
		)

	style(scoped).
		:scope {
			position: absolute;
			display: block;
			width: 400px;
			height: 240px;
		}
		:scope .inner {
			position: absolute;
			top: 0;
			left: 50px;
			width: 300px;
			height: 240px;
			overflow: auto;
		}
		:scope .back-log {
			position: absolute;
			top: 10px;
			right: 10px;
			width: 30px;
			height: 30px;
			background-color: #222;
			border: solid 1px #D57774;
			border-radius: 50%;
			cursor: pointer;
			background-image: url(../images/back_log.png);
			background-size: 60%;
			background-position: center;
			background-repeat: no-repeat;
			z-index: 1;
		}

	script(type="coffee").
		@comments = []

		##
		# メインエリアに戻る
		##
		@toggleLog = =>
			observer.trigger 'hidden-log-area'

		# tweet ----------------------------------------------------------
		observer.on 'tweet', (data) =>
			@comments.unshift data
			@update()


