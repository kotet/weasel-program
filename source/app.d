import std.stdio;
import std.ascii : uppercase;

static immutable alphabets = uppercase ~ " ";

void main(string[] args)
{
	import std.getopt;

	string target = "METHINKS IT IS LIKE A WEASEL";
	size_t offsprings_num = 1000;
	double mutation_rate = 0.09;

	auto opt = getopt(args, "t|target", "Target string.", &target,
			"n|offsprings_num", "Number of offspring per generation.",
			&offsprings_num, "r|mutation_rate",
			"Mutation rate: probability that any given letter will change.", &mutation_rate);

	if (opt.helpWanted)
	{
		defaultGetoptPrinter("D implementation of Richard Dawkin's weasel program.", opt.options);
		return;
	}

	target = target.escape();

	writefln("Number of offspring per generation: %d", offsprings_num);
	writefln("Mutation rate: %f", mutation_rate);
	writefln("Target:   \"%s\" (%d characters)", target, target.length);

	string parent = generateRandomString(target.length);
	size_t generation;
	while (true)
	{
		long score = evaluateScore(parent, target);
		writefln("Gen %04d: \"%s\" (score: %d)", generation++, parent, score);
		if (score == target.length)
		{
			return;
		}
		parent = cumulativeSelection(parent, target, mutation_rate, offsprings_num);
	}
}

string cumulativeSelection(string p, string target, double mutation_rate, size_t offsprings_num)
{
	import std.range : generate, take;

	auto offsprings = generate!(() => mutate(p, mutation_rate))().take(offsprings_num);
	string best_offspring = offsprings.front;
	offsprings.popFront();
	long maxscore = evaluateScore(best_offspring, target);
	foreach (offspring; offsprings)
	{
		long score = evaluateScore(offspring, target);
		if (maxscore < score)
		{
			maxscore = score;
			best_offspring = offspring;
		}
	}
	return best_offspring;
}

string mutate(string s, double mutation_rate)
{
	import std.random : uniform01, randomSample;
	import std.algorithm : filter;
	import std.range : array;

	string r;
	foreach (i, c; s)
		if (uniform01() < mutation_rate)
		{
			r ~= alphabets.filter!(x => x != c).array().randomSample(1).front;
		}
		else
		{
			r ~= c;
		}
	return r;
}

long evaluateScore(string s, string t)
{
	assert(s.length == t.length);
	long score;
	foreach (i; 0 .. s.length)
		score += s[i] == t[i];
	return score;
}

string generateRandomString(size_t length)
{
	import std.random : uniform;
	import std.range : generate, take, array;
	import std.conv : text;
	import std.algorithm : map;

	return generate!(() => uniform(0, alphabets.length))().map!(i => alphabets[i])
		.take(length).array().text();
}

string escape(string t)
{
	string r;
	foreach (c; t)
		if (c == ' ')
		{
			r ~= c;
		}
		else if ('A' <= c && c <= 'Z')
		{
			r ~= c;
		}
		else if ('a' <= c && c <= 'z')
		{
			r ~= c + ('A' - 'a');
		}
		else
		{
			r ~= ' ';
		}
	return r;
}
