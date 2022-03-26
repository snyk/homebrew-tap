class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.883.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.883.0/snyk-macos"
    sha256 "8c756ea2fcb81d0409c96884da443716929236296d19dddbe247859e5d612151"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.883.0/snyk-linux"
    sha256 "a45df8ef3115e1a4d1498dc58215d422a7b9c37b4a429b7bbdd623e97ea6adcb"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
