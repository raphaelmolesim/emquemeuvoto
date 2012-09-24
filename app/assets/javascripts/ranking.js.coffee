class Ranking
	constructor: ->
		@scores = 
			'haddad' : 0
			'serra' : 0
			'russomano' : 0
			'soninha' : 0
			'chalita' : 0

	compute_vote: (vote, priority, proposers, oppenents) ->
		if (vote)
			weight = if priority then 2 else 1
			for p in proposers
				@scores[p] += 1 * weight
			#for o in oppenents
			#	@scores[o] -= 1
		else
			for p in proposers
				@scores[p] -= 2
			#for o in oppenents
			#	@scores[o] += 1

	compute_priority: (proposers, priority) ->
		for p in proposers
			@scores[p] += priority

	get_score: ->
		@scores

	get_name: (candidate_class) -> 
		{
			"haddad" : 'Fernando Haddad',
			"serra" : 'José Serra',
			"russomano" : 'Celso Russomano',
			"soninha" : 'Soninha Francine',
			"chalita" : 'Gabriel Chalita'
		}[candidate_class]

	leaders: ->
		max_score = 0
		for candidate_key, score of @scores
			max_score = score if (score >= max_score)
		candidates = []
		for candidate_key, score of @scores
			if (score == max_score)
				max_score = score
				console.log("leader ==> #{candidate_key}")
				candidates.push(candidate_key)	
		{ class: item, name : this.get_name(item) } for item in candidates

window.Ranking = Ranking
		