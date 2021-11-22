class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.767.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.767.0/snyk-macos"
    sha256 "13a6a8671960fddccd1c3eb458cb687341114bd48739b3806dd91dda9a9c83a0"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.767.0/snyk-linux"
    sha256 "492bf17815c7432bd50a3b832c11571302856b64cb228f9a6ff7ab66a11a12e6"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
