class Ranking
	constructor: ->
		@scores = 
			'haddad' : 0
			'serra' : 0
			'russomano' : 0
			'soninha' : 0
			'chalita' : 0

	compute_vote: (vote, proposers, oppenents) ->
		if (vote)
			for p in proposers
				@scores[p] += 1
			for o in oppenents
				@scores[o] -= 1
		else
			for p in proposers
				@scores[p] -= 1
			for o in oppenents
				@scores[o] += 1

	get_score: ->
		@scores

	get_name: (candidate_class) -> 
		{
			"haddad" : 'Fernando Haddad',
			"serra" : 'serra',
			"russomano" : 'Celso Russomano',
			"soninha" : 'Soninha Francine',
			"chalita" : 'Gabriel Chalita'
		}[candidate_class]

	leaders: ->
		max_score = 0
		candidates = []
		for candidate_key, score of @scores
			if (score >= max_score)
				max_score = score
				candidates.push(candidate_key)	
		{ class: item, name : this.get_name(item) } for item in candidates

window.Ranking = Ranking
		