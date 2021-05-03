class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "v1.575.0"

  if OS.mac?
    url "https://github.com/snyk/snyk/releases/download/v1.575.0/snyk-macos"
    sha256 "b0337f0815334c37a9521e36d4c530634160b969d8de10ffb5096651a117abca"
  elsif OS.linux?
    url "https://github.com/snyk/snyk/releases/download/v1.575.0/snyk-linux"
    sha256 "3e79c8ba17057d4bcfd42e7d54a04a46e0485144546e196c4ba4c15ff612d817"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
