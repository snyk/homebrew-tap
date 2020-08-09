class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "v1.370.1"

  if OS.mac?
    url "https://github.com/snyk/snyk/releases/download/v1.370.1/snyk-macos"
    sha256 "5fd69f2c8f98cd5557ceee848dea32f856fd3cc7435649fba0266c0a18330100"
  elsif OS.linux?
    url "https://github.com/snyk/snyk/releases/download/v1.370.1/snyk-linux"
    sha256 "904123f4298f35198cf25e601b95aeb2d524206d3e7b4929e82abed4242a54f3"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
