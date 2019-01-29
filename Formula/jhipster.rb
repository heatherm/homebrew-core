require "language/node"

class Jhipster < Formula
  desc "Generate, develop and deploy Spring Boot + Angular/React applications"
  homepage "https://www.jhipster.tech/"
  url "https://registry.npmjs.org/generator-jhipster/-/generator-jhipster-5.8.1.tgz"
  sha256 "8ff083a66b913ec23d99eded9b3b16770e6a94f770af39efeb85e8206d387eb6"

  bottle do
    cellar :any_skip_relocation
    sha256 "a635702b8a42925ffc47c951f1811b85d6df603634f4321f7917523e6839b97c" => :mojave
    sha256 "13eb454f2c85a024b1d35e27bf628de562b75553616fad0081bae855d0afdf13" => :high_sierra
    sha256 "9bfb1876af3c8c40b5e0c78695978c54804b6c7e7bf9557d6c3ef3b461b966bf" => :sierra
  end

  depends_on :java => "1.8+"
  depends_on "node"

  def install
    system "npm", "install", *Language::Node.std_npm_install_args(libexec)
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    assert_match "execution is complete", shell_output("#{bin}/jhipster info")
  end
end
