package lti.quiz.bean;

public class OptionBean {
	private String option, pattern;

	public OptionBean(String string, String string2) {
		this.setOption(string);
		this.setPattern(string2);
	}

	public String getOption() {
		return option;
	}

	public void setOption(String option) {
		this.option = option;
	}

	public String getPattern() {
		return pattern;
	}

	public void setPattern(String pattern) {
		this.pattern = pattern;
	}

}
